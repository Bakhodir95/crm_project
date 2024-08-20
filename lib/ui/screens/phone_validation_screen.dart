import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneValidationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                SvgPicture.asset(
                  'assets/appicon.svg', // Replace with your logo asset path
                  height: 60.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  'STEP 1/4',
                  style: TextStyle(fontSize: 14.sp, color: Colors.blueAccent),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Valid your phone',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                _buildPhoneNumberField(),
                SizedBox(height: 20.h),
                _buildSMSCodeField(),
                SizedBox(height: 20.h),
                _buildSMSTimerInfo(),
                SizedBox(height: 20.h),
                _buildEmailField(),
                SizedBox(height: 20.h),
                _buildPasswordField(),
                SizedBox(height: 40.h),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Row(
      children: [
        Container(
          width: 80.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButton<String>(
            value: '+1',
            underline: SizedBox(),
            items: ['+1', '+998', '+44'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              labelText: 'Mobile Number',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSMSCodeField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 50.w,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSMSTimerInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        'SMS was sent to your number\n+1 345 673-56-67\nIt will be valid for 01:25',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blueAccent, fontSize: 14.sp),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        labelText: 'Email Address',
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        labelText: 'Create Password',
        suffixIcon: Icon(Icons.remove_red_eye),
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Next Step',
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
