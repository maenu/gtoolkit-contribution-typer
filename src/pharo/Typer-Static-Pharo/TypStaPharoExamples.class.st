Class {
	#name : #TypStaPharoExamples,
	#superclass : #Object,
	#category : #'Typer-Static-Pharo-Examples'
}

{ #category : #accessing }
TypStaPharoExamples >> neoJsonCore [
	<gtExample>
	TypMethodResolvers instance resolvers
		removeAll;
		add: TypStaMethodResolver new.
	TypVariableResolvers instance resolvers
		removeAll;
		add: TypStaVariableResolver new.
	^ #'Neo-JSON-Tests' asPackage methods
]
