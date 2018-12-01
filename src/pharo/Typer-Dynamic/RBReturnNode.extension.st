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
	self propertyAt: #typDynReturns put: TypUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynMonitor [
	^ self propertyAt: #typDynMonitor
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturn: anObject [
	| value_ |
	value_ := anObject class typAsType.
	self typDynMonitor critical: [ self typDynReturns increment: value_ ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturns [
	^ self propertyAt: #typDynReturns
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynUninstall [
	self removeProperty: #typDynMonitor ifAbsent: [  ].
	self removeProperty: #typDynReturns ifAbsent: [  ].
	self
		propertyAt: #typDynLink
		ifPresent: [ :e | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ]
]
