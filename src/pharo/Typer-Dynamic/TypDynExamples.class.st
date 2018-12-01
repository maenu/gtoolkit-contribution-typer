Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #accessing }
TypDynExamples >> neoJsonCore [
	<gtExample>
	| methods collector testResult association |
	methods := #'Neo-JSON-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ (#'Neo-JSON-Tests' asPackage definedClasses
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e | e suite run: testResult ] ].
	TypMethodResolvers instance resolvers
		removeAll;
		add: association value key.
	TypVariableResolvers instance resolvers
		removeAll;
		add: association value value.
	^ testResult -> #'Neo-JSON-Tests' asPackage methods
]
