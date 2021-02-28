Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynAssign: anObject [
	<typTypeArgument: 1 as: 'Object'>
	SharedRandom globalGenerator next
		< (1 - (self typDynAssigns weights size / 200))
		ifTrue: [ self typDynAssigns add: anObject typInfSelfType ].
	self typDynAssigns weights size >= 100
		ifTrue: [ self typDynRemoveLink ]
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynAssigns [
	<typTypeResultAs: 'TypDynUnionType'>
	^ (self propertyAt: #typDynAssigns ifAbsentPut: [ TypDynUnionType new ]) "typCastAs TypDynUnionType"
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
	self propertyAt: #typDynStashed put: TypDynUnionType new.
	self propertyAt: #typDynAssigns put: TypDynUnionType new.
	self propertyAt: #typDynLink put: link.
	self link: link
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynRemoveLink [
	self
		propertyAt: #typDynLink
		ifPresent: [ :e "typCastAs MetaLink"
			 | 
			self removeProperty: #typDynLink ifAbsent: [  ].
			self removeLink: e ]
		ifAbsent: [  ]
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynStash [
	self typDynStashed addAll: self typDynAssigns.
	self propertyAt: #typDynAssigns put: TypDynUnionType new
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynStashed [
	^ self propertyAt: #typDynStashed
]

{ #category : #'*Typer-Dynamic' }
RBAssignmentNode >> typDynUninstall [
	self removeProperty: #typDynStashed ifAbsent: [  ].
	self removeProperty: #typDynAssigns ifAbsent: [  ].
	self typDynRemoveLink
]
