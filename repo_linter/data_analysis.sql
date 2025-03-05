SELECT DISTINCT
	linter_repo.repo_id, 
	linter_repo.repo_git, 
	linter_repo.lint_status, 
	linter_rules.lint_results_id, 
	linter_rules."id", 
	linter_rules."name", 
	linter_rules.rule_type, 
	linter_rules.status, 
	linter_lint_results.repo_id, 
	linter_lint_results."id", 
	linter_lint_results.passed, 
	linter_lint_results.errored
FROM
	linter_lint_results
	INNER JOIN
	linter_repo
	ON 
		linter_lint_results.repo_id = linter_repo.repo_id
	INNER JOIN
	linter_rules
	ON 
		linter_lint_results."id" = linter_rules.lint_results_id AND
		linter_repo.repo_id = linter_rules.repo_id
	INNER JOIN
	linter_targets
	ON 
		linter_repo.repo_id = linter_targets.repo_id AND
		linter_rules."id" = linter_targets.rule_id
		Where name='readme-file-exists' or name='license-file-exists'
	ORDER BY linter_repo.repo_id, name; 