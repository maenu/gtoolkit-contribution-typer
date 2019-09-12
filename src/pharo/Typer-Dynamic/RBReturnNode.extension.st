Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynInstall [
	| link |
	self typDynUninstall.
	link := MetaLink new
		metaObject: #node;
		selector: #typDynReturn:;
		arguments: #(value).
	self propertyAt: #typDynMonitor put: Monitor new.
	self propertyAt: #typDynStashed put: TypDynUnionType new.
	self propertyAt: #typDynReturns put: TypDynUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynMonitor [
	<typTypeResultAs: 'Monitor'>
	^ (self propertyAt: #typDynMonitor) "typCastAs Monitor"
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
	self typDynMonitor
		critical: [ SharedRandom globalGenerator next
				< (1 - (self typDynReturns weights size / 100) max: 0.01)
				ifTrue: [ | value_ |
					value_ := anObject typSelfType.
					self typDynReturns add: value_ ].
			self typDynReturns weights size >= 100
				ifTrue: [ self typDynRemoveLink ] ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturns [
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	^ (self propertyAt: #typDynReturns) "typCastAs TypDynUnionType<TypType>"
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
	self removeProperty: #typDynMonitor ifAbsent: [  ].
	self removeProperty: #typDynStashed ifAbsent: [  ].
	self removeProperty: #typDynReturns ifAbsent: [  ].
	self typDynRemoveLink
]
