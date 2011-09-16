package com.kevin.test.jface;

import org.eclipse.jface.action.ActionContributionItem;
import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class TestAction extends ApplicationWindow {

	public TestAction(Shell parentShell) {
		super(parentShell);
	}

	@Override
	protected Control createContents(Composite parent) {
		HelloAction action = new HelloAction(parent.getShell());
		ActionContributionItem aci = new ActionContributionItem(action);
		aci.fill(parent);
		return parent;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TestAction demo = new TestAction(null);
		demo.setBlockOnOpen(true);
		demo.open();
		Display.getCurrent().dispose();
	}

}
