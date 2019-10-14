Extension { #name : #RBComment }

{ #category : #'*Typer-Core' }
RBComment >> typCastAs [
	<typTypeResultAs: 'TypType'>
	self assert: [ self typIsCastAs ].
	^ (self contents copyFrom: 'typCastAs ' size + 1 to: self contents size) typAsType
]

{ #category : #'*Typer-Core' }
RBComment >> typIsCastAs [
	<typTypeResultAs: 'Boolean'>
	^ self contents beginsWith: 'typCastAs '
]

{ #category : #'*Typer-Core' }
RBComment >> typIsParameters [
	<typTypeResultAs: 'Boolean'>
	^ self contents beginsWith: 'typParameters '
]

{ #category : #'*Typer-Core' }
RBComment >> typParameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	self assert: [ self typIsParameters ].
	^ (self contents copyFrom: 'typParameters ' size + 1 to: self contents size) typAsTypes
]
