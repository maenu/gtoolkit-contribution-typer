Class {
	#name : #TypGtMondrianStep,
	#superclass : #GtMondrianStep,
	#category : #'Typer-GToolkit-Mondrian'
}

{ #category : #accessing }
TypGtMondrianStep >> includesNode: anObject [

	^ self root graph
		  nodeAt: anObject
		  ifPresent: [ true ]
		  ifAbsent: [ false ]
]

{ #category : #accessing }
TypGtMondrianStep >> nodeAt: anObject ifAbsent: aBlock [

	^ self root graph nodeAt: anObject ifAbsent: aBlock
]

{ #category : #accessing }
TypGtMondrianStep >> nodeAt: anObject put: aNode [

	^ self root graph nodeAt: anObject put: aNode
]
