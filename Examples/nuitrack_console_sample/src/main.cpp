#include <nuitrack/Nuitrack.h>

#include <signal.h>
#include <iomanip>
#include <iostream>
#include <fstream>
#include <chrono>

using namespace tdv::nuitrack;
using namespace std::chrono;

void showHelpInfo()
{
    std::cout << "Usage: nuitrack_console_sample [path/to/nuitrack.config]" << std::endl;
}

// Callback for the hand data update event
void onHandUpdate(HandTrackerData::Ptr handData, std::ofstream& outFile)
{
    if (!handData)
    {
        // No hand data
        std::cout << "No hand data. Skeleton not detected." << std::endl;
        // Skeleton lost by the camera (assign 1)
        outFile << "0,0,0,0,0,1" << std::endl;
        return;
    }

    auto userHands = handData->getUsersHands();
    if (userHands.empty())
    {
        // No user hands
        std::cout << "No user hands. Skeleton not detected." << std::endl;
        // Skeleton lost by the camera (assign 1)
        outFile << "0,0,0,0,0,1" << std::endl;
        return;
    }

    auto rightHand = userHands[0].rightHand;
    auto leftHand = userHands[0].leftHand;

    if (!rightHand || !leftHand)
    {
        // Either left or right hand data is missing
        std::cout << "Missing hand data. Skeleton not detected." << std::endl;
        // Skeleton lost by the camera (assign 1)
        outFile << "0,0,0,0,0,1" << std::endl;
        return;
    }

    // Get the current timestamp
    auto timestamp = duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();

    // Determine orientation (1 for forward, -1 for backward)
    int orientation = 0;
    if (leftHand->xReal < rightHand->xReal)
    {
        orientation = 1; // Forward facing
    }
    else if (leftHand->xReal > rightHand->xReal)
    {
        orientation = -1; // Backward facing
    }

    // Skeleton not lost by the camera (assign 0)
    outFile << std::fixed << std::setprecision(3)
            << timestamp << "," // Timestamp
            << leftHand->xReal << "," << leftHand->zReal << ","
            << rightHand->xReal << "," << rightHand->zReal << ","
            << orientation << ","
            << "0" << std::endl;
}

void onNewSkeletonCallback(SkeletonData::Ptr skeletonData, std::ofstream& outFile)
{
    if (skeletonData)
    {
        for (const auto& skeleton : skeletonData->getSkeletons())
        {
            // Extracting the z-position of the skeleton's left collar joint
            float zPosition = skeleton.joints[JOINT_LEFT_COLLAR].real.z;

            printf("Skeleton (ID: %d) at position - X: %d, Y: %d, Z: %d\n",
                   skeleton.id, (int)skeleton.joints[JOINT_LEFT_COLLAR].real.x,
                   (int)skeleton.joints[JOINT_LEFT_COLLAR].real.y,
                   (int)skeleton.joints[JOINT_LEFT_COLLAR].real.z);

            // Writing the data to the CSV file
            outFile << std::fixed << std::setprecision(3)
                    << skeleton.id << "," // Skeleton ID
                    << skeleton.joints[JOINT_LEFT_COLLAR].real.x << "," // X-position
                    << skeleton.joints[JOINT_LEFT_COLLAR].real.y << "," // Y-position
                    << zPosition << std::endl; // Z-position
        }
        std::cout << "-----------------------\n";
    }
}

bool finished;
void signalHandler(int signal)
{
    if (signal == SIGINT)
        finished = true;
}

int main(int argc, char* argv[])
{
    showHelpInfo();

    signal(SIGINT, &signalHandler);

    std::string configPath = "";
    if (argc > 1)
        configPath = argv[1];

    // Open the CSV file for writing
    std::ofstream outFile("hand_data.csv");
    if (!outFile.is_open())
    {
        std::cerr << "Failed to open output file." << std::endl;
        return EXIT_FAILURE;
    }

    // Initialize Nuitrack
    try
    {
        Nuitrack::init(configPath);
    }
    catch (const Exception& e)
    {
        std::cerr << "Can not initialize Nuitrack (ExceptionType: " << e.type() << ")" << std::endl;
        return EXIT_FAILURE;
    }
    auto devices = Nuitrack::getDeviceList();
    Nuitrack::setDevice(devices[0]);    
    // Create HandTracker module, other required modules will be
    // created automatically
    auto handTracker = HandTracker::create();

    // Connect onHandUpdate callback to receive hand tracking data
    handTracker->connectOnUpdate([&](HandTrackerData::Ptr handData) {
        onHandUpdate(handData, outFile);
    });

    auto depthSensor = DepthSensor::create();
	auto colorSensor = ColorSensor::create();
	auto skeletonTracker = SkeletonTracker::create();

    skeletonTracker->connectOnUpdate([&](SkeletonData::Ptr skeletonData) {
        onNewSkeletonCallback(skeletonData, outFile);
    });

    // Start Nuitrack
    try
    {
        Nuitrack::run();
    }
    catch (const Exception& e)
    {
        std::cerr << "Can not start Nuitrack (ExceptionType: " << e.type() << ")" << std::endl;
        return EXIT_FAILURE;
    }

    int errorCode = EXIT_SUCCESS;
    while (!finished)
    {
        try
        {
            // Wait for new hand tracking data
            Nuitrack::waitUpdate(handTracker);
        }
        catch (LicenseNotAcquiredException& e)
        {
            std::cerr << "LicenseNotAcquired exception (ExceptionType: " << e.type() << ")" << std::endl;
            errorCode = EXIT_SUCCESS;
            break;
        }
        catch (const Exception& e)
        {
            std::cerr << "Nuitrack update failed (ExceptionType: " << e.type() << ")" << std::endl;
            errorCode = EXIT_FAILURE;
        }
    }

    // Release Nuitrack
    try
    {
        Nuitrack::release();
    }
    catch (const Exception& e)
    {
        std::cerr << "Nuitrack release failed (ExceptionType: " << e.type() << ")" << std::endl;
        errorCode = EXIT_FAILURE;
    }

    // Close the output file
    outFile.close();

    return errorCode;
}
