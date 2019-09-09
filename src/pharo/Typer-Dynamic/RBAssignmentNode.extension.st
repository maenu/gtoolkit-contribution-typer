Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynAssign: anObject [
	<typTypeArgument: 1 as: 'Object'>
	| value_ |
	value_ := anObject typSelfType.
	self typDynMonitor critical: [ self typDynAssigns add: value_ ]
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynAssigns [
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	^ (self propertyAt: #typDynAssigns ifAbsentPut: [ TypDynUnionType new ]) "typCastAs TypDynUnionType<TypType>"
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynInstall [
	| link |
	self typDynUninstall.
	link := MetaLink new
		metaObject: #node;
		selector: #typDynAssign:;
		control: #after;
		arguments: #(value).
	self propertyAt: #typDynMonitor put: Monitor new.
	self propertyAt: #typDynAssigns put: TypDynUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynMonitor [
	<typTypeResultAs: 'Monitor'>
	^ (self propertyAt: #typDynMonitor) "typCastAs Monitor"
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynUninstall [
	self removeProperty: #typDynMonitor ifAbsent: [  ].
	self removeProperty: #typDynAssigns ifAbsent: [  ].
	self
		propertyAt: #typDynLink
		ifPresent: [ :e "typCastAs MetaLink" | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ]
]
