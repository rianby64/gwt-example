
FROM gwt
COPY ./MyApp/. /gwt/MyApp/.

WORKDIR /gwt/MyApp

CMD [ "ant", "devmode" ]
