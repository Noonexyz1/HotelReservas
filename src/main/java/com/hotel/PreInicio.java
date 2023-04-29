package com.hotel;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@WebServlet(name = "PreInicio", urlPatterns = {"/"})
@ServerEndpoint(value = "/updates")
public class PreInicio extends HttpServlet {
    
    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    //private static final Set<Session> sessions = Collections.synchronizedSet(Set.of());
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //redirigimos a la ventana de bienvenida
        request.getRequestDispatcher("bienvenida.jsp").forward(request, response);
    }
    
    
    
    @OnOpen
    public void onOpen(Session session) throws IOException {
        sessions.add(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        for (Session s : sessions) {
            if (s.isOpen()) {
                s.getBasicRemote().sendText(message);
            }
        }
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        sessions.remove(session);
    }

    @OnError
    public void onError(Throwable throwable) {
        // Do error handling here
    }
    
    
    

}
