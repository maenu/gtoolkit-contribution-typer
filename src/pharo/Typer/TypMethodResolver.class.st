Class {
	#name : #TypMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'methodSelector',
		'argumentTypes',
		'methodType',
		'resultType'
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
TypMethodResolver >> resultType [
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	resultType := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypeForArgumentAt: anInteger [
	^ self typTypeForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ (argumentTypes at: anInteger) copy
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypeForResult [
	^ self typTypeForResultWithDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypeForResultForReceiver: aType withDiscovered: aSet [
	| returns |
	returns := self typTypeForResultWithDiscovered: aSet.
	^ returns isUnknown
		ifTrue: [ aType ]
		ifFalse: [ returns ]
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypeForResultForReceivers: aType [
	^ self typTypeForResultForReceiver: aType withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypeForResultWithDiscovered: aSet [
	^ resultType copy
]
