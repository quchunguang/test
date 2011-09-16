package com.kevin.test.jface;

import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Text;

public class TestJface {

	private Shell sShell = null; // @jve:decl-index=0:visual-constraint="31,19"
	private Button button = null;
	private Text text = null;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * Before this is run, be sure to set up the launch configuration
		 * (Arguments->VM Arguments) for the correct SWT library path in order
		 * to run with the SWT dlls. The dlls are located in the SWT plugin jar.
		 * For example, on Windows the Eclipse SWT 3.1 plugin jar is:
		 * installation_directory\plugins\org.eclipse.swt.win32_3.1.0.jar
		 */
		Display display = Display.getDefault();
		TestJface thisClass = new TestJface();
		thisClass.createSShell();
		thisClass.sShell.open();

		while (!thisClass.sShell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		display.dispose();
	}

	/**
	 * This method initializes sShell
	 */
	private void createSShell() {
		sShell = new Shell();
		sShell.setText("Shell");
		sShell.setSize(new Point(659, 296));
		sShell.setLayout(null);
		button = new Button(sShell, SWT.NONE);
		button.setBounds(new Rectangle(273, 225, 104, 29));
		button.setText("OK");
		text = new Text(sShell, SWT.BORDER);
		text.setBounds(new Rectangle(43, 42, 551, 33));
		button.addMouseListener(new org.eclipse.swt.events.MouseAdapter() {
			public void mouseUp(org.eclipse.swt.events.MouseEvent e) {
				MessageBox dialog = new MessageBox(sShell, SWT.OK
						| SWT.ICON_INFORMATION);
				dialog.setText("Hello");
				dialog.setMessage(text.getText());
				dialog.open();
			}
		});
	}

}
