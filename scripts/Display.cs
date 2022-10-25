using Godot;
using System;

public class Display : Control
{
	public void SetScore(int value)
	{
		GetNode<Label>("%ScoreValue").Text = value.ToString();
	}

	public void SetMissed(int value)
	{
		GetNode<Label>("%MissedValue").Text = value.ToString();
	}
}
