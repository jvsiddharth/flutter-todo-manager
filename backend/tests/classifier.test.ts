import { classifyTask } from '../src/modules/tasks/classifier';

describe('Task Classification Logic', () => {

  test('detects scheduling category and high priority', () => {
    const result = classifyTask(
      'Urgent meeting',
      'Schedule meeting with team today'
    );

    expect(result.category).toBe('scheduling');
    expect(result.priority).toBe('high');
    expect(result.suggested_actions).toContain('Block calendar');
  });

  test('detects finance category and medium priority', () => {
    const result = classifyTask(
      'Budget review',
      'Review budget and invoice this week'
    );

    expect(result.category).toBe('finance');
    expect(result.priority).toBe('medium');
    expect(result.suggested_actions).toContain('Check budget');
  });

  test('extracts entities such as person names and date references', () => {
    const result = classifyTask(
      'Team sync',
      'Schedule call with Alice tomorrow'
    );

    expect(result.extracted_entities).toEqual(
      expect.arrayContaining(['Alice', 'date_reference'])
    );
  });

  test('detects technical category and defaults to low priority', () => {
    const result = classifyTask(
      'Bug fix',
      'Fix minor UI bug in dashboard'
    );

    expect(result.category).toBe('technical');
    expect(result.priority).toBe('low');
    expect(result.suggested_actions).toContain('Diagnose issue');
  });

  test('falls back to general category and low priority when no keywords match', () => {
    const result = classifyTask(
      'Read document',
      'Read internal company policy'
    );

    expect(result.category).toBe('general');
    expect(result.priority).toBe('low');
    expect(result.suggested_actions).toEqual([]);
  });

});
