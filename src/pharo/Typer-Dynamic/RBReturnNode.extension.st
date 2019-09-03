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
RBReturnNode >> typDynReturn: anObject [
	<typTypeArgument: 1 as: 'Object'>
	| value_ |
	value_ := anObject typSelfType.
	self typDynMonitor critical: [ self typDynReturns increment: value_ ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturns [
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	^ (self propertyAt: #typDynReturns) "typCastAs TypDynUnionType<TypType>"
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynUninstall [
	self removeProperty: #typDynMonitor ifAbsent: [  ].
	self removeProperty: #typDynReturns ifAbsent: [  ].
	self
		propertyAt: #typDynLink
		ifPresent: [ :e "typCastAs MetaLink" | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ]
]
