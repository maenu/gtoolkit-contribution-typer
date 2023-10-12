Extension { #name : #SequenceableCollection }

{ #category : #'*Typer-Core' }
SequenceableCollection >> typWithIndexFlatCollect: aBlock [
	self isEmpty ifTrue: [ ^ self copy ].
	^ self species
		new: 0
		streamContents: [ :stream | self withIndexDo: [ :e :i | stream nextPutAll: (aBlock value: e value: i) ] ]
]
