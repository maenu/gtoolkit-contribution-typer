Extension { #name : #RBComment }

{ #category : #'*Typer' }
RBComment >> typCastAs [
	<typTypeResultAs: 'TypType'>
	self assert: [ self typIsCastAs ].
	^ (contents copyFrom: 'typCastAs ' size + 1 to: contents size) typAsType
]

{ #category : #'*Typer' }
RBComment >> typIsCastAs [
	<typTypeResultAs: 'Boolean'>
	^ contents beginsWith: 'typCastAs '
]

{ #category : #'*Typer' }
RBComment >> typIsParameters [
	<typTypeResultAs: 'Boolean'>
	^ contents beginsWith: 'typParameters '
]

{ #category : #'*Typer' }
RBComment >> typParameters [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	self assert: [ self typIsParameters ].
	^ (contents copyFrom: 'typParameters ' size + 1 to: contents size) typAsTypes
]
