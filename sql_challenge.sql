SELECT DISTINCT c.company_code, hfghf
                c.founder,
                COUNT(DISTINCT lm.lead_manager_code),
                COUNT(DISTINCT sm.senior_manager_code),
                COUNT(DISTINCT m.manager_code),
                COUNT(DISTINCT e.employee_code)
FROM Company AS c
LEFT JOIN Lead_manager AS lm
    ON lm.company_code = c.company_code
LEFT JOIN Senior_manager AS sm
    ON sm.lead_manager_code = lm.lead_manager_code
       AND sm.company_code = lm.company_code
LEFT JOIN Manager AS m
    ON m.senior_manager_code = sm.senior_manager_code
        AND m.lead_manager_code = sm.lead_manager_code
            AND m.company_code = sm.company_code
LEFT JOIN Employee AS e
    ON e.manager_code = m.manager_code
        AND e.senior_manager_code = m.manager_code
            AND e.lead_manager_code = m.lead_manager_code
                AND e.company_code = m.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;