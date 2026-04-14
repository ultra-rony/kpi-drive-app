.PHONY: clean get build all

clean:
	@echo "🧹 Очистка проекта..."
	flutter clean

get:
	@echo "📦 Установка зависимостей..."
	flutter pub get

build:
	@echo "⚙️ Генерация кода..."
	flutter pub run build_runner build --delete-conflicting-outputs

all: clean get build
	@echo "✅ Готово!"

get_mason:
	@echo "👨‍🎤 Установка зависимостей mason..."
	mason get feature

new_feature:
	@echo "🧟‍♂️ Создание новой фичи!"
	mason make feature

feature: get_mason new_feature build get

ios_rebuild:
	@echo "🍎 Ребилд ios"
	flutter clean && \
	flutter pub get && \
	cd ios/ && \
    	rm -rf Pods/ && \
    	rm -rf Podfile.lock && \
    	pod repo update && \
    	pod install

xcode:
	@echo "🍎 Открываем xcode"
	open ios/Runner.xcworkspace