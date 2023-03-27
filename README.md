# Godot Tween Comparisons | [Try it on the web!](https://popcar2.itch.io/tweens-comparison)
![A gif showcasing the project. It shows different comparisons of various Tween types](Images/Tween_Comparison_Project.gif)

This project is a collection of simple scenes to compare different tween types! You can change the speed, ease type, and cooldown
 on the fly using the settings tab at the bottom of the screen.
 
 It's made in Godot 4, and you can easily just download and import the project to play around with it!
 
### Where's Tween.TRANS_CIRC?
 
TRANS_CIRC sucks.

Okay, I'm joking. The real reason is that there's 11 tween transitions in total and there wasn't really a great way to organize them all in one scene.
 I decided to axe TRANS_CIRC because I'm assuming it's not very popular.
 If you want to see it in action, you can easily just open Scripts/SceneController.gd
 and replace one of the `.set_trans(...)` with `.set_trans(Tween.TRANS_CIRC)`. Make sure to change it after the else statement as well.
 
### How Do I Edit the Values of the Tweens/Make My Own Tweens?

Open the scene you'd like to edit, click on Control (the root node in the heirarchy), and expand the array of TweenResource in the inspector.
 This is a custom resource I made to make things easier to change.

There, you'll be able to change the values of the Tween or add more elements to Tween more things.
 Feel free to duplicate the starting scene and test whatever tween you'd like to see!

Loved the project? [Consider buying me a cup of ko-fi!](https://ko-fi.com/popcar2)
