package com.kevin.test.jface;

import org.eclipse.jface.action.MenuManager;
import org.eclipse.jface.action.ToolBarManager;
import org.eclipse.jface.window.ApplicationWindow;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class Hiyou extends ApplicationWindow {
	private SayHiAction hiaction;

	public Hiyou(Shell parentShell) {
		super(parentShell);
		hiaction = new SayHiAction(getShell());
		addMenuBar();
		addToolBar(SWT.FLAT | SWT.WRAP);
	}

	@Override
	protected MenuManager createMenuManager() {
		MenuManager menubar = new MenuManager();

		MenuManager fileMenu = new MenuManager("&File");
		fileMenu.add(hiaction);
		menubar.add(fileMenu);

		MenuManager exitMenu = new MenuManager("&Exit");
		exitMenu.add(hiaction);
		menubar.add(exitMenu);
		
		return menubar;
	}

	@Override
	protected ToolBarManager createToolBarManager(int style) {
		ToolBarManager toolbar = new ToolBarManager();
		toolbar.add(hiaction);
		return toolbar;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Hiyou window = new Hiyou(null);
		window.setBlockOnOpen(true);
		window.open();
		Display.getCurrent().dispose();
	}

}
