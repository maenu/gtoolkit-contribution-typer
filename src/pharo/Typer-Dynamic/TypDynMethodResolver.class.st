Class {
	#name : #TypDynMethodResolver,
	#superclass : #TypMethodResolver,
	#instVars : [
		'methodClass',
		'methodSelector',
		'argumentTypes',
		'resultTypes'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #accessing }
TypDynMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypDynMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #accessing }
TypDynMethodResolver >> methodClass [
	^ methodClass
]

{ #category : #accessing }
TypDynMethodResolver >> methodClass: anObject [
	methodClass := anObject
]

{ #category : #accessing }
TypDynMethodResolver >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
TypDynMethodResolver >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> resolves: aCompiledMethod [
	^ aCompiledMethod methodClass = methodClass and: [ aCompiledMethod selector = methodSelector ]
]

{ #category : #accessing }
TypDynMethodResolver >> resultTypes [
	^ resultTypes
]

{ #category : #accessing }
TypDynMethodResolver >> resultTypes: anObject [
	resultTypes := anObject
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ (argumentTypes at: anInteger) copy
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> typTypesForResultWithDiscovered: aSet [
	^ resultTypes copy
]
