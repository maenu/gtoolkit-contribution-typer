Extension { #name : #TypShaMethodOrigin }

{ #category : #'*Typer-GToolkit' }
TypShaMethodOrigin >> typGtShadowMethodFor: aView [

	<gtView>
	^ aView forward
		  title: 'Shadow Method';
		  priority: 9;
		  object: [ method ];
		  view: #gtSourceFor:
]
