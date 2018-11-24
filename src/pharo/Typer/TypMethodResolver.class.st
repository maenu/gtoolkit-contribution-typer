Class {
	#name : #TypMethodResolver,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolverFor: aCompiledMethod [
	^ self
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: aCompiledMethod [
	^ true
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForArgumentAt: anInteger [
	^ self typTypesForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ TypTypes new
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
	^ TypTypes new
]
