Class {
	#name : #TypMethodResolver,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypMethodResolver >> resolverFor: aCompiledMethod [
	self assert: [ self resolves: aCompiledMethod ].
	^ self
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: aCompiledMethod [
	^ true
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ TypTypes new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForResultForReceivers: aTypes withDiscovered: aSet [
	^ TypTypes new
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> typTypesForResultWithDiscovered: aSet [
	^ TypTypes new
]
