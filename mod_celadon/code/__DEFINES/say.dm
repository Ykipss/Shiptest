///Celadon-change
//так как Hear() всегда выполняет compose_message(), даже если какая-то функция обработала сообщение с помощью compose_message() до Hear().
///Чтобы этого избежать была придумана такая "заглушка". Если true - Hear() не обрабатывает сообщение с помощью compose_message().
#define MODE_MSG_COMPOSED "message_composed"
