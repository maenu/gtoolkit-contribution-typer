Extension { #name : #BlElement }

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOnMouseOut [
	self typGtOpacity: 0.1
]

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOnMouseOver [
	self
		typGtOpacity: 0.9;
		zIndex: (parent children collect: [ :e | e elevation elevation ]) max + 1
]

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOnReset [
	self typGtOpacity: 0.7
]

{ #category : #'*Typer-GToolkit' }
BlElement >> typGtOpacity: aNumber [
	| node |
	node := self userData at: #typGtNode.
	self background: (node typGtBackground: aNumber)
]
