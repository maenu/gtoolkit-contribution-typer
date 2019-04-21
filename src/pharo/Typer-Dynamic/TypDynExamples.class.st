Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #accessing }
TypDynExamples >> neoJsonCore [
	<gtExample>
	<typTypeResultAs: 'Association<TestResult,Collection<CompiledMethod<Integer>>>'>
	| methods collector testResult association |
	methods := #'Neo-JSON-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ (#'Neo-JSON-Tests' asPackage definedClasses
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e"typCastAs TestCase class"
					 | e suite run: testResult ] ].
	TypMethodResolvers reset resolvers
		add: association key value.
	TypVariableResolvers reset resolvers
		add: association value.
	^ testResult -> #'Neo-JSON-Core' asPackage methods
]
