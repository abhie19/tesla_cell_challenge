"""
Utility module
"""
def find_plan(input_string, plans):
    """
    Args:
        input_string (str): input string, example is 'AGG'
        plans (list): a list of plans to select from
    Returns
        relevant_plans (list): list of relevant plans
    """
    #implement the function
    plans_to_return = []
    # Case agnostic input
    input_string = input_string.upper()
    # ensure plans is not empty
    if len(plans)<1: return 'No plans to search from'
    for plan in plans:
        if input_string in plan.upper():  plans_to_return.append(plan)
    if len(plans_to_return)<1: return 'No plans found with substring {}'.format(input_string)
    else: return plans_to_return
