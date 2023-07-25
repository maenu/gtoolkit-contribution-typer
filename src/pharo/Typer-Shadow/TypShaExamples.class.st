Class {
	#name : #TypShaExamples,
	#superclass : #Object,
	#category : #'Typer-Shadow-Examples'
}

{ #category : #accessing }
TypShaExamples >> lookupMethod [
	<gtExample>
	| lookup |
	lookup := TypMethodLookup
			receiver: Collection typAsType
			selector: #anyOne
			arguments: #()
			super: nil.
	self assert: (TypShaMethodResolver instance canResolve: lookup).
	^ TypShaMethodResolver instance resolve: lookup
]

{ #category : #accessing }
TypShaExamples >> lookupType [
	<gtExample>
	^ TypShaTypeResolver instance
		resolve: (TypTypeLookup classDescription: Collection super: nil)
]

{ #category : #accessing }
TypShaExamples >> lookupVariable [
	<gtExample>
	| lookup |
	lookup := TypVariableLookup
			receiver: GtPharoMethodCoder typAsType
			selector: #astCache
			super: nil.
	self assert: (TypShaVariableResolver instance canResolve: lookup).
	^ TypShaVariableResolver instance resolve: lookup
]
