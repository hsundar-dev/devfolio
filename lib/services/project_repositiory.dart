
import 'package:devfolio/models/projects_model.dart';

class ProjectRepository {
    static List<ProjectModel> getProjects() {
      return [
        ProjectModel(
          title: "AI Voice-Controlled Remote PC Automation (Mobizync)",
          description: "A cross-platform automation system integrating Flutter, Python, and Node.js to enable seamless Android–PC connectivity with real-time control through interactive UI, GenAI-powered voice command execution (via Gemini), customizable macros, and in-app terminal access for direct CMD operations, achieving around 80% operational efficiency.",
          imageUrl: "assets/projects/mobizync.png",
          technologies: [
            "assets/logos/flutter.png",
            "assets/logos/python.png"
          ],
          projectUrl:  "https://zenodo.org/records/15207764",
        ),
        ProjectModel(
          title: "Eye-Based Cursor Control (Hands Free Mouse)",
          description: "A Python application leveraging OpenCV and MediaPipe FaceMesh to track eye gaze through the camera and control mouse movements accordingly, achieving around 75% accuracy in real-time cursor automation.",
          imageUrl: "assets/projects/hfm.png",
          technologies: [
            "assets/logos/python.png"
          ],
          projectUrl:  "https://www.youtube.com/watch?v=mSCn_JWlpMU&feature=youtu.be",
        ),
        ProjectModel(
          title: "Hand-Based Cursor Control (CamAutoGUI)",
          description: "An intelligent Python application built with OpenCV, MediaPipe Hands, and PyAutoGUI that enables seamless, hands-free cursor control through real-time hand gesture recognition and motion tracking—serving as the foundational prototype for the later Eye-Based Cursor Automation system.",
          imageUrl: "assets/projects/cag.png",
          technologies: [
            "assets/logos/python.png"
          ],
          projectUrl:  "https://www.youtube.com/watch?v=mSCn_JWlpMU&feature=youtu.be",
        ),
        ProjectModel(
          title: "Brahmastra’23 – College Event Website",
          description: "An interactive college event platform built with PHP and MySQL, featuring real-time user analytics, automated scheduling, and admin tools to manage 500+ participants efficiently and streamline event operations.",
          imageUrl: "assets/projects/brahmastra.png",
          technologies: [
            "assets/logos/html.png",
            "assets/logos/css.png",
            "assets/logos/js.png",
            "assets/logos/php.png",
            "assets/logos/mysql.png"
          ],
          projectUrl:  "https://www.chettinadtech.ac.in/brahmastra23/",
        ),
        ProjectModel(
          title: "Library Management System (LMS)",
          description: "A web-based library management system built with HTML, CSS, JavaScript, PHP, and MySQL, automating book issuing and returns, featuring a search-friendly CRUD interface with CSV integration, and improving librarian efficiency by 60%.",
          imageUrl: "assets/projects/lms.png",
          technologies: [
            "assets/logos/html.png",
            "assets/logos/css.png",
            "assets/logos/js.png",
            "assets/logos/php.png",
            "assets/logos/mysql.png"
          ],
          projectUrl:  "https://www.chettinadtech.ac.in/CCETlib/",
        ),
        ProjectModel(
          title: "Innohive - Students Innovation Hub Application",
          description: "A full-stack app built with Flutter, FastAPI, and MongoDB that allows student teams to share projects, track progress, and earn rankings, featuring a Python backend deployed on Vercel.",
          imageUrl: "assets/projects/innohive.png",
            technologies: [
              "assets/logos/flutter.png",
              "assets/logos/python.png",
              "assets/logos/mongodb.png"
            ],
          projectUrl:  "https://www.youtube.com/watch?v=lg1x0qKZR_Q"
        ),
        ProjectModel(
          title: "Stud-Dev - Student Developer Community App",
          description: "A prototype collaborative platform for student teams, built using data from a GitHub-hosted static db.json file, enabling project sharing, ranking, and team collaboration, and serving as the precursor to the more advanced InnoHive platform.",
          imageUrl: "assets/projects/studev.png",
          technologies: [
            "assets/logos/flutter.png"
          ],
          projectUrl:  ""
        )
    ];
  }
}