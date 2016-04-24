DrawingBoard.Control.DrawingMode = DrawingBoard.Control.extend({

	name: 'drawingmode',

	defaults: {
		pencil: true,
		eraser: true,
		filler: true
	},

	initialize: function() {

		this.prevMode = this.board.getMode();
		var btnMap = {"eraser":"earaser",
			"pencil":"pencil",
			"filler":"paintbucket"};
		$.each(["pencil", "eraser", "filler"], $.proxy(function(k, value) {
			if (this.opts[value]) {
				var btn = this.$el.find('.'+btnMap[value]);
				btn.data("mode",value);
				btn.on('click', $.proxy(function(e) {
					var value = $(e.currentTarget).data("mode");
					var mode = this.board.getMode();
					if (mode !== value) this.prevMode = mode;
					var newMode = mode === value ? this.prevMode : value;
					this.board.setMode( newMode );
					e.preventDefault();
				}, this))
			}
		}, this));

		/*this.$el.on('click', 'span[data-mode]', $.proxy(function(e) {
			var value = $(e.currentTarget).attr('data-mode');
			alert(value);
			var mode = this.board.getMode();
			if (mode !== value) this.prevMode = mode;
			var newMode = mode === value ? this.prevMode : value;
			this.board.setMode( newMode );
			e.preventDefault();
		}, this));*/

		this.board.ev.bind('board:mode', $.proxy(function(mode) {
			this.toggleButtons(mode);
		}, this));

		this.toggleButtons( this.board.getMode() );
	},

	toggleButtons: function(mode) {
		this.$el.find('button[data-mode]').each(function(k, item) {
			var $item = $(item);
			$item.toggleClass('active', mode === $item.attr('data-mode'));
		});
	}

});
