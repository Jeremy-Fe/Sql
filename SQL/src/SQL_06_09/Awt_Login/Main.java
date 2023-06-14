package SQL_06_09.Awt_Login;

import java.awt.Button;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;

public class Main extends WindowAdapter implements ActionListener{
	private Frame f, fMain;
	private TextField tfId, tfPwd, tfMsg;
	private Button bLogin;
	private MemberDao dao;
	
	
	public Main() {
		dao = new MemberDao();
		f = new Frame("Login Frame");
		f.setSize(500, 300);
		f.setLayout(null);
		f.addWindowListener(this);
		
		Label lid = new Label("ID : ");
		lid.setBounds(50, 50, 100, 40);
		
		tfId = new TextField();
		tfId.setBounds(160, 60, 190, 40);
		
		Label lpwd = new Label("Password : ");
		lpwd.setBounds(50, 120, 100, 40);
		
		tfPwd = new TextField();
		tfPwd.setBounds(160, 120, 190, 40);
		tfPwd.setEchoChar('*'); // 비밀번호 * 로 보이게 하는 것
		
		bLogin = new Button("ENTER");
		bLogin.setBounds(370, 60, 100, 100);
		bLogin.addActionListener(this);
		
		tfMsg = new TextField();
		tfMsg.setBounds(50, 180, 420, 60);
		tfMsg.setEditable(false); // 수정이 안됨
		tfMsg.setFocusable(false); // 포커싱이 안됨
		
		f.add(lid);
		f.add(tfId);
		f.add(lpwd);
		f.add(tfPwd);
		f.add(bLogin);
		f.add(tfMsg);
		
		f.setVisible(true);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		System.out.println(tfId.getText() + " : " + tfPwd.getText());
		
		String strId = tfId.getText();
		
		ArrayList<MemberVo> list = dao.list(strId);
		
		if(list.size() == 1) {
			MemberVo data = (MemberVo) list.get(0);
			String id = data.getId();
			String pwd = data.getPassword();
			
			System.out.println("DB ==> " + id + " : " + pwd);
			
			if(tfPwd.getText().equals(pwd)) {
				System.out.println("로그인이 되었습니다!");
				tfMsg.setText("로그인이 되었습니다.!");
				
				fMain = new Frame("메인 프레임"); // 로그인 성공시 생성되는 메인 프레임
				fMain.setBounds(500, 200, 500, 500);
				fMain.addWindowListener(this);
				fMain.setVisible(true);
			} else {
				System.out.println("다시 입력하세요.");
				tfMsg.setText("Password가 틀렸습니다. 다시 입력하세요.");
			}
		} else {
			tfMsg.setText("ID가 틀렸습니다. 다시 입력하세요.");
		}
	}
	
	public void windowClosing(WindowEvent e) {
		System.out.println(e.getComponent().getName()); // 프레임 이름 출력하기
		
		if(e.getComponent() == fMain) {
			fMain.dispose();
		} else if(e.getComponent() == f) {
			f.dispose();
			fMain.dispose(); // 로그인 창을 끄면 둘 다 꺼지게
		}
	}
	public static void main(String[] args) {
		new Main();
		
	}
}
