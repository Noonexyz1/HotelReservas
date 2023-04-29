<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebSocket Example</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                $(document).ready(function () {
                var socket = new WebSocket("ws://localhost:8080/HotelReservas/updates");
                socket.onmessage = function (event) {
                    var message = event.data;
                    $('#messages').append('<p>' + message + '</p>');
                }
                $('#sendButton').click(function () {
                    var message = $('#message').val();
                    socket.send(message);
                });
            });
        </script>
    </head>
    
    <body>
        
        <h1>WebSocket Example</h1>
        
        <div id="messages"></div>
        
        <input type="text" id="message">
        <button id="sendButton">Send</button>
        
    </body>
    
</html>
