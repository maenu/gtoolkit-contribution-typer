Class {
	#name : #TypMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'methodSelector',
		'argumentTypes',
		'resultTypes',
		'methodType'
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
TypMethodResolver >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
TypMethodResolver >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #accessing }
TypMethodResolver >> methodType [
	^ methodType
]

{ #category : #accessing }
TypMethodResolver >> methodType: anObject [
	methodType := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: aCompiledMethod [
	^ aCompiledMethod methodClass typAsType = methodType and: [ aCompiledMethod selector = methodSelector ]
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
