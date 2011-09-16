package com.kevin.test.jface;

import org.eclipse.jface.action.Action;
import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.resource.ImageDescriptor;
import org.eclipse.jface.window.Window;
import org.eclipse.swt.widgets.Shell;

public class SayHiAction extends Action {

	private Shell shell;

	public SayHiAction(Shell shell) {
		super();
		this.shell = shell;
		this.setText("Say&Hi@Ctrl+H");
		this.setImageDescriptor(ImageDescriptor.createFromFile(this.getClass(),
				"hi.gif"));
	}

	@Override
	public void run() {
		InputDialog input = new InputDialog(shell, "Input your name",
				"Please input your name here:", null, null);
		if (input.open() == Window.OK) {
			MessageDialog.openInformation(shell, "Hello",
					"Hello, " + input.getValue() + "!");
		}
	}

}
