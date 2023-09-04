Extension { #name : #BlElement }

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOnMouseOut [
	self typGtOpacity: 0.3
]

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOnMouseOver [
	self
		typGtOpacity: 1;
		zIndex: (parent children collect: [ :e | e elevation elevation ]) max + 1.
	parent
		removeChild: self;
		addChildFirst: self
]

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOpacity: aNumber [
	| node |
	node :=  self userData at: #typGtNode.
	self border: (node typGtBorder: aNumber)
]
