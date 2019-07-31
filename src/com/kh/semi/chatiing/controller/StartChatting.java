package com.kh.semi.chatiing.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/start")
public class StartChatting {

	private static Map<String, Session> user = Collections.synchronizedMap(new HashMap<String, Session>());
	private static Map<String, Session> admin = Collections.synchronizedMap(new HashMap<String, Session>());
	private Chattstorage chat = new Chattstorage();
	//private static Map<String, ArrayList<String>> chat = Collections.synchronizedMap(new HashMap<String, ArrayList<String>>());


	@OnOpen
	public void onOpen(Session session) {
		System.out.println("start 웹소켓");
		String chatmember = session.getQueryString();
		System.out.println("start 웹소켓 쿼리 : " + chatmember);

		String[] member = chatmember.split("&");
		String[] keyrArr = member[0].split(":");
		String[] kindArr = member[1].split(":");

		String key = keyrArr[1];
		String kind = kindArr[1];

		if(kind.equals("user")) {
			user.put(key, session);
		}else {
			admin.put(key, session);
			chat.intoChattstorage(key);
			System.out.println("첫번째 ccc");
		}

		if(chat.getChat().get(key) != null) {
			System.out.println("세번째 ccc");
			ArrayList<String> chatting = chat.getChat().get(key);
			for(int i = 0; i < chatting.size(); i++) {
				System.out.println("해당채팅내용 : " + chatting.get(i) );
				synchronized(admin) {
					try {
						admin.get(key).getBasicRemote().sendText(chatting.get(i));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}





	}

	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {

		System.out.println(msg);

		String[] msgArr = msg.split("#");
		String key = "";
		String message = "";

		for(int i = 0; i < msgArr.length; i++) {
			if(i == 0) {
				key = msgArr[i];
			}else {
				message += msgArr[i];
			}
		}

		/*chat.intoChattstorage(key, message);*/

		synchronized(user) {
			user.get(key).getBasicRemote().sendText(message);
		}

		synchronized(admin) {
			admin.get(key).getBasicRemote().sendText(message);
		}



	}

	@OnError
	public void onError(Throwable e) {
		//데이터를 전달하는 과정에서 에러가 발생할 경우 동작하는 메소드
		e.printStackTrace();
	}

	@OnClose
	public void onClose(Session session) {
		//지워주지 않으면 Set에 이미 나간 사용자가 남아있기 때문에 메세지 전송시 에러 난다.
		user.remove(session);
		admin.remove(session);
	}

}
