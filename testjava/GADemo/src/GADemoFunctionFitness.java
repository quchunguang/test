import org.jgap.FitnessFunction;
import org.jgap.IChromosome;

public class GADemoFunctionFitness extends FitnessFunction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected double evaluate(IChromosome a_subject) {
		int sum = 1;
		int numOfGens = a_subject.size();
		for (int i = 0; i < numOfGens; i++) {
			sum += (Integer) a_subject.getGene(i).getAllele();
		}
		return sum;
	}

	public static int getValueAtGene(IChromosome a_potentialSolution,
			int a_position) {
		Integer value = (Integer) a_potentialSolution.getGene(a_position)
				.getAllele();
		return value.intValue();
	}
}