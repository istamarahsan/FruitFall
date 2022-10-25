using Godot;
using System;

public class Bucket : Node2D
{
	[Signal]
	public delegate void AppleCaught(Node apple);

	private void _on_Area2D_body_entered(object body)
	{
		switch (body)
		{
			case Node node:
				if (node.IsInGroup("Apples")) EmitSignal(nameof(AppleCaught), node);
				break;
		}
	}
}
