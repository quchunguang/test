package com.kevin.test.jface;

import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.window.Window;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Menu;
import org.eclipse.swt.widgets.MenuItem;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.TabFolder;
import org.eclipse.swt.widgets.TabItem;
import org.eclipse.swt.widgets.Text;

public class HelloJface extends Window {

	private Text text;
	private Button btnOK;

	protected HelloJface(Shell parentShell) {
		super(parentShell);
	}

	@Override
	protected Control createContents(Composite parent) {
		// create menubar
		createMenu();

		// create Tab Folder
		TabFolder tf = new TabFolder(getShell(), SWT.NONE);
		tf.setLayout(new FillLayout());
		createTabItem(tf);
		createTabItem(tf);

		// create textbox and button
		createText(parent);
		
		return super.createContents(parent);
	}

	private void createMenu() {
		Menu menubar = new Menu(getShell(), SWT.BAR);
		MenuItem fileitem = new MenuItem(menubar, SWT.CASCADE);
		fileitem.setText("&File");
		Menu filemenu = new Menu(getShell(), SWT.DROP_DOWN);
		fileitem.setMenu(filemenu);
		MenuItem openItem = new MenuItem(filemenu, SWT.PUSH);
		openItem.setText("&Open");
		openItem.addSelectionListener(new SelectionAdapter(){
			@Override
			public void widgetSelected(SelectionEvent e) {
				InputDialog input = new InputDialog(getShell(),
						"Input Dialog Title", "Please input some string here",
						"initial value",null);
				if(input.open()==Window.OK){
					System.out.println(input.getValue());
				}
			}
		});
		MenuItem exititem = new MenuItem(filemenu, SWT.PUSH);
		exititem.setText("&Exit");
		exititem.addSelectionListener(new SelectionAdapter(){
			@Override
			public void widgetSelected(SelectionEvent e) {
				boolean ret = MessageDialog.openConfirm(getShell(), "Exit", "Do you really want to quit?");
				if(ret){
					getShell().close();
				}
			}
		});
		getShell().setMenuBar(menubar);
	}

	private void createText(Composite parent) {
		text = new Text(parent, SWT.NONE);
		text.setText("Hello,world!");
		btnOK = new Button(parent, SWT.PUSH);
		btnOK.setText("OK");
		btnOK.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseUp(MouseEvent e) {
				MessageDialog.openInformation(getShell(), "Hello",
						text.getText());
			}
		});
	}

	private void createTabItem(TabFolder tf) {
		TabItem ti = new TabItem(tf, SWT.NONE);
		ti.setText("A Simple TalItem");
		Composite composite = new Composite(tf, SWT.NONE);
		composite.setLayout(new GridLayout(2, true));

		for (int i = 0; i < 3; i++) {
			Label label = new Label(composite, SWT.RIGHT);
			Text text2 = new Text(composite, SWT.NONE);
			label.setText("Text" + i + ":");

		}

		ti.setControl(composite);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		HelloJface demo = new HelloJface(null);
		demo.setBlockOnOpen(true);
		demo.open();
		Display.getCurrent().dispose();
	}

}
