require 'telegram/bot'
require_relative 'main'

$token = ''

class TelegramBot < Recipes
  def initialize
    bot_logic
  end

  def bot_start(bot, message)
    bot.api.send_message(chat_id: message.chat.id, text: "Привет, этот бот придуман гением Ruby community!\nНужен для поиска и добавления рецептов.\nЧеловек который решил воспользоваться ботом -> #{message.from.first_name}")
  end

  def bot_stop
    bot.api.send_message(chat_id: message.chat.id, text: "Bye #{message.from.first_name}")
    exit
  end

  def bot_help(bot, message)
    bot.api.send_message(chat_id: message.chat.id, text: "Помощь
      Вот мои функции:
      /start -> чтобы запустить бота
      /stop -> чтобы остановить бота
      /find_recipe -> чтобы найти рецепт
      /help -> чтобы узнать все команды которые доступны
      Следующие функции в разработке :)
      ")
  end

  def ingreds_name(message)
    message.to_s.gsub('/find_recipe', '').strip
  end

  def bot_find_recipe(bot, message)
    return unless message.text.include? '/find_recipe'
    class_recipes = Recipes.new
    puts ingreds_name(message)
    bot.api.send_message(chat_id: message.chat.id, text: class_recipes.find_recipe(ingreds_name(message)))
    puts class_recipes.find_recipe(ingreds_name(message))
  end

  def bot_add_recipe(message)
    #ADD RECIPES TO HASH
  end

  def bot_doesnt(bot, message)
    bot.api.send_message(chat_id: message.chat.id, text: "Бот не понимает что вы ввели. Возможно вы ввели что-то неправильно. Воспользуйтесь командой /help")
  end

  def bot_logic
    Telegram::Bot::Client.run($token) do |bot|
      bot.listen do |message|
        puts message
        case message.text
        when '/start'
          bot_start(bot, message)
        when '/stop'
          bot_stop(bot, message)
        when '/help'
          bot_help(bot, message)
        # when '/find_recipe'
        #   bot_find_recipe(bot, message)
        # else
        #    bot_doesnt(bot, message)
        end
        bot_find_recipe(bot, message)
      end
    end
  end
end

TelegramBot.new
