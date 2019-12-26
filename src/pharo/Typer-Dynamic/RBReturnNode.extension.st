Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynInstall [
	| link |
	self typDynUninstall.
	link := MetaLink new
		metaObject: #node;
		selector: #typDynReturn:;
		arguments: #(value).
	self propertyAt: #typDynStashed put: TypDynUnionType new.
	self propertyAt: #typDynReturns put: TypDynUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynRemoveLink [
	self
		propertyAt: #typDynLink
		ifPresent: [ :e "typCastAs MetaLink"
			 | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturn: anObject [
	<typTypeArgument: 1 as: 'Object'>
	SharedRandom globalGenerator next
		< (1 - (self typDynReturns weights size / 200))
		ifTrue: [ self typDynReturns add: anObject typSelfType ].
	self typDynReturns weights size >= 100
		ifTrue: [ self typDynRemoveLink ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturns [
	<typTypeResultAs: 'TypDynUnionType'>
	^ (self propertyAt: #typDynReturns) "typCastAs TypDynUnionType"
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynStash [
	self typDynStashed addAll: self typDynReturns.
	self propertyAt: #typDynReturns put: TypDynUnionType new
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynStashed [
	^ self propertyAt: #typDynStashed
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynUninstall [
	self removeProperty: #typDynStashed ifAbsent: [  ].
	self removeProperty: #typDynReturns ifAbsent: [  ].
	self typDynRemoveLink
]
