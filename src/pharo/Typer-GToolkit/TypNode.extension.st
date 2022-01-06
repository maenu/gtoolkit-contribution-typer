Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> gtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | self paintOn: m ]
]
