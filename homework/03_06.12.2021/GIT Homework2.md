# GIT Homework 2

1. На локальном репозитории сделать ветки для:
    - Postman `git branch postman`
    - Jmeter `git branch jmeter`
    - CheckLists `git branch check_lists`
    - Bag Reports `git branch bug_reports`
    - SQL `git branch sql`
    - Charles `git branch charles`
    - Mobile testing `git branch mobile_testing`

2. Запушить все ветки на внешний репозиторий:
    - `git push -u origin postman`
    - `git push -u origin jmeter`
    - `git push -u origin check_lists`
    - `git push -u origin bug_reports`
    - `git push -u origin sql`
    - `git push -u origin charles`
    - `git push -u origin mobile_testing`
	
	или `git push --all origin`

3. В ветке Bag Reports сделать текстовый документ со структурой баг репорта: `git checkout bug_reports`, ` touch bug_report.txt`, `vim bug_report.txt`
4. Запушить структуру багрепорта на внешний репозиторий: `git add .`, `git commit -m "bug_report"`, `git push`
5. Вмержить ветку Bag Reports в Main: `git checkout main`, `git merge bug_reports`
6. Запушить main на внешний репозиторий: `git add .`, `git commit -m "bug_reports merge"`, `git push`
7. В ветке CheckLists набросать структуру чек листа: `git checkout check_lists`, `touch check_list.txt`, `vim check_list.txt`
8. Запушить структуру на внешний репозиторий: `git add .`, `git commit -m "check list"`, `git push`
9. На внешнем репозитории сделать Pull Request ветки CheckLists в main
10. Синхронизировать Внешнюю и Локальную ветки Main: `git checkout main`, `git pull`