Class {
	#name : #TypDynMethodResolver,
	#superclass : #TypMethodResolver,
	#instVars : [
		'ast'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #accessing }
TypDynMethodResolver >> ast [
	^ ast
]

{ #category : #accessing }
TypDynMethodResolver >> ast: anObject [
	ast := anObject
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> resolves: aCompiledMethod [
	^ aCompiledMethod methodClass = ast methodClass and: [ aCompiledMethod selector = ast selector and: [ ast typDynIsCovered ] ]
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ ast typDynTypesForArgumentAt: anInteger withDiscovered: aSet
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> typTypesForResultForReceivers: aTypes withDiscovered: aSet [
	^ ast typDynTypesForResultForReceivers: aTypes withDiscovered: aSet
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> typTypesForResultWithDiscovered: aSet [
	^ ast typDynTypesForResultWithDiscovered: aSet
]
