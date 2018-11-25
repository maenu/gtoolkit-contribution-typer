Class {
	#name : #TypMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'methodClass',
		'methodSelector',
		'argumentTypes',
		'resultTypes'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #accessing }
TypMethodResolver >> methodClass [
	^ methodClass
]

{ #category : #accessing }
TypMethodResolver >> methodClass: anObject [
	methodClass := anObject
]

{ #category : #accessing }
TypMethodResolver >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
TypMethodResolver >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: aCompiledMethod [
	^ aCompiledMethod methodClass = methodClass and: [ aCompiledMethod selector = methodSelector ]
]

{ #category : #accessing }
TypMethodResolver >> resultTypes [
	^ resultTypes
]

{ #category : #accessing }
TypMethodResolver >> resultTypes: anObject [
	resultTypes := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForArgumentAt: anInteger [
	^ self typTypesForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ (argumentTypes at: anInteger) copy
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForResult [
	^ self typTypesForResultWithDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForResultForReceivers: aTypes [
	^ self typTypesForResultForReceivers: aTypes withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForResultForReceivers: aTypes withDiscovered: aSet [
	| returns |
	returns := self typTypesForResultWithDiscovered: aSet.
	^ returns isEmpty
		ifTrue: [ aTypes ]
		ifFalse: [ returns ]
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForResultWithDiscovered: aSet [
	^ resultTypes copy
]
