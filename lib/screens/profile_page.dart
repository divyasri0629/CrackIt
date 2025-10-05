import 'package:crackit/screens/loginsignuipage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB2D6CD),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFB2D6CD)),
      
        child: SizedBox(
          height: 800,
          width: double.maxFinite,
          child: Stack(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFB2D6CD)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  color: Color(0xFFA695B7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 140,
                bottom: 90,
                right: 20,
                left: 20,
                child: Card(
                  elevation: 5,
      
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
      
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 200),
                        //  Padding(padding: EdgeInsets.all(10),),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('My Progress'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProgressStatsScreen(),
                              ),
                            );
                          },
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(Icons.key),
                          title: Text('ChangePassword'),
                           onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChangePasswordPage(),
                              ),
                            );
                          },
                         
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(Icons.feedback_outlined),
                          title: Text('Feedback'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FeedbackScreen(),
                              ),
                            );
                          },
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.help),
                          title: const Text('Help Center'),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpCenterPage()));
                          },
      
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                        Divider(),
                      ListTile(
                        leading: Icon(Icons.logout,color: Colors.red,),
                        title: Text('Logout',style: TextStyle(color: Colors.red),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginsignuipage()));
                        },
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      ],
                    ),
                  ),
      
                  //height: 50,
                  //width: 50,
                ),
              ),
              Positioned(
                top: 300,
                left: 150,
                child: Text(
                  "Student",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
      
              Positioned(
                top: 150,
                left: MediaQuery.of(context).size.width / 2 - 60,
      
                child: const CircleAvatar(
                  radius: 60,
      
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/portrait-beautiful-women-round-frame-avatar-female-character-isolated-white-background_559729-215.jpg',
                  ),
      
                  // Replace with your asset path
                ),
              ),
              Positioned(
                top: 235,
                right: 130,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfilePage(),
                      ),
                    );
                  },
      
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _onEditProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile Updated!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB2D6CD),

      appBar: AppBar(
        backgroundColor: Color(0xFFB2D6CD),
        elevation: 0,
        title: const Text(
          'EDIT PROFILE',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: NetworkImage(
                          "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 35,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFB2D6CD),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Full Name",
                        labelStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "E-Mail",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Phone No",
                        labelStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(Icons.call, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 10) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),

                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _onEditProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressStatsScreen extends StatelessWidget {
  const ProgressStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB2D6CD),
      appBar: AppBar(
        title: const Text('Progress & Stats'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Interview Prep Progress",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildProgressItem("Aptitude", 0.7),
            _buildProgressItem("Technical MCQs", 0.45),
            _buildProgressItem("HR Round", 0.9),

            const SizedBox(height: 30),

            // Stats
            _buildStatsCard("MCQs Attempted", "120"),
            _buildStatsCard("Mock Interviews", "4"),

            const SizedBox(height: 30),
            const Text(
              "Achievements",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildBadges(),
          ],
        ),
      ),
    );
  }
  Widget _buildProgressItem(String title, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ${(percent * 100).toInt()}%"),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: percent,
            backgroundColor: Colors.grey[300],
            color: Colors.teal,
            minHeight: 10,
          ),
        ],
      ),
    );
  }
  Widget _buildStatsCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.bar_chart, color: Colors.teal),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBadges() {
    List<Map<String, String>> badges = [
      {"label": "First MCQ Solved", "icon": "💡"},
      {"label": "First Technical Round", "icon": "🛠"},
      {"label": "Mock Interview Champ", "icon": "🏆"},
      {"label": "Consistency Badge", "icon": "📅"},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: badges.map((badge) {
        return Chip(
          avatar: Text(badge["icon"]!, style: const TextStyle(fontSize: 18)),
          label: Text(badge["label"]!),
          backgroundColor: Colors.teal[100],
        );
      }).toList(),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  // PLACE THIS FUNCTION HERE
  void _changePassword() async {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("New passwords do not match"),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password changed successfully"),
          backgroundColor: Color(0xFFB2D6CD),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 300));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA695B7),
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Form container (scrollable)
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFB2D6CD),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: _oldPasswordController,
                          obscureText: _obscureOld,
                          decoration: _buildInputDecoration("Old Password", _obscureOld, () {
                            setState(() {
                              _obscureOld = !_obscureOld;
                            });
                          }),
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter old password' : null,
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: _newPasswordController,
                          obscureText: _obscureNew,
                          decoration: _buildInputDecoration("New Password", _obscureNew, () {
                            setState(() {
                              _obscureNew = !_obscureNew;
                            });
                          }),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Enter new password';
                            if (value.length < 6) return 'Password too short';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirm,
                          decoration: _buildInputDecoration("Confirm Password", _obscureConfirm, () {
                            setState(() {
                              _obscureConfirm = !_obscureConfirm;
                            });
                          }),
                          validator: (value) =>
                              value!.isEmpty ? 'Please confirm password' : null,
                        ),
                        const SizedBox(height: 30),

                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _changePassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA695B7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Confirm',
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      String labelText, bool isObscured, VoidCallback toggleVisibility) {
    return InputDecoration(
      fillColor: const Color(0xFFB2D6CD),
      filled: true,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black),
      prefixIcon: const Icon(Icons.lock, color: Colors.black),
      suffixIcon: IconButton(
        icon: Icon(
          isObscured ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
        onPressed: toggleVisibility,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thank You!'),
        content: const Text('Your feedback has been submitted.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.clear();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        backgroundColor: Color(0xFFB2D6CD),
        appBar: AppBar(title: const Text('Feedback Form'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your feedback:',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type your feedback here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _showConfirmationDialog,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center',style: TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          CircleAvatar(radius: 70, child: Image.network('https://www.pngmart.com/files/22/Help-Desk-PNG-Transparent.png')),
          SizedBox(height:30,),

          // Logo
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Text("For any technical queries or support-related concerns, contact our team directly. Assistance is available for all technical issues ",style: TextStyle(fontSize: 16),),
         ),

          const SizedBox(height: 30),

          // Email Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F8F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.email, color: Colors.green, size: 28),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Email Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "support@crackit.in",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F8F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.call, color: Colors.green, size: 28),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "+91 70759 38669",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - 30)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}