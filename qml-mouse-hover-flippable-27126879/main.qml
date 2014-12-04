import QtQuick 2.0

MouseArea
{
	id: mouseArea
	width: 240
	height: 240

	hoverEnabled: true
	onEntered:
	{
		console.log("Entered");
		flipable.flipped = !flipable.flipped
	}
	onExited:
	{
		console.log("Exited");
		flipable.flipped = !flipable.flipped
	}

	Flipable
	{
		id: flipable
		width: 240
		height: 240

		property bool flipped: false
		//property bool flipped: mouseArea.containsMouse // uncoment if onEntered and onExited is commented

		front: Rectangle
		{
			color: "red"
			anchors.fill: parent
		}

		back: Rectangle
		{
			color: "blue"
			anchors.fill: parent
		}

		transform: Rotation
		{
			id: rotation
			origin.x: flipable.width / 2
			origin.y: flipable.height / 2
			axis.x: 0
			axis.y: 1
			axis.z: 0
			angle: 0
		}

		states: State
		{
			name: "back"
			PropertyChanges
			{
				target: rotation
				angle: 180
			}
			when: flipable.flipped
		}

		transitions: Transition
		{
			NumberAnimation
			{
				target: rotation
				property: "angle"
				duration: 1000
			}
		}
	}
}
