package com.kevin.test.jface;

import org.eclipse.jface.action.Action;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.swt.widgets.Shell;

public class HelloAction extends Action {
	private Shell shell;
	
	public HelloAction(Shell shell) {
		super("&Hello",Action.AS_PUSH_BUTTON);
		this.shell = shell;
	}
	
	@Override
	public void run() {
		MessageDialog.openInformation(shell, "Hello", "Hello Action!");
	}

}
