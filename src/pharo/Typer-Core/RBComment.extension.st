Extension { #name : #RBComment }

{ #category : #'*Typer-Core' }
RBComment >> typBindings [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	self assert: [ self typIsBindings ].
	^ (self contents copyFrom: 'typBindings ' size + 1 to: self contents size) typAsTypes
]

{ #category : #'*Typer-Core' }
RBComment >> typCastAs [
	<typTypeResultAs: 'TypType'>
	self assert: [ self typIsCastAs ].
	^ (self contents copyFrom: 'typCastAs ' size + 1 to: self contents size) typAsType
]

{ #category : #'*Typer-Core' }
RBComment >> typIsBindings [
	<typTypeResultAs: 'Boolean'>
	^ self contents beginsWith: 'typBindings '
]

{ #category : #'*Typer-Core' }
RBComment >> typIsCastAs [
	<typTypeResultAs: 'Boolean'>
	^ self contents beginsWith: 'typCastAs '
]
